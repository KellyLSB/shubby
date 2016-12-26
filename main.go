package main

import (
	"C"
	"fmt"
	"os"
)
import (
	"github.com/davecgh/go-spew/spew"
	"github.com/therecipe/qt/core"
	_ "github.com/therecipe/qt/datavisualization"
	"github.com/therecipe/qt/gui"
	"github.com/therecipe/qt/qml"
)

// Application instance
var Application *gui.QGuiApplication

func main() {
	Application = gui.NewQGuiApplication(len(os.Args), os.Args)
	Application.SetApplicationDisplayName("Our Friend Shubby")

	engine := qml.NewQQmlApplicationEngine(nil)

	engine.ConnectChildEvent(func(event *core.QChildEvent) {
		object := event.Child()
		fmt.Printf(
			"\nChildEvent!\nType: %# v\nObjectName: %q\n",
			event.Type(),
			object.ObjectName(),
		)

		spew.Dump(object)
	})

	engine.ConnectObjectCreated(func(object *core.QObject, url *core.QUrl) {
		fmt.Printf(
			"\nObjectCreated!\nQML File: %q\nObjectName: %q\n",
			url.Path(core.QUrl__PrettyDecoded),
			object.ObjectName(),
		)

		spew.Dump(object)
	})

	engine.Load2("qml/main.qml")

	os.Exit(gui.QGuiApplication_Exec())
}
