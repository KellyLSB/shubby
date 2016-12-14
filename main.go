package main

import (
	"C"
	"os"

	"github.com/therecipe/qt/core"
	"github.com/therecipe/qt/widgets"
)

func main() {
	widgets.NewQApplication(len(os.Args), os.Args)

	//create a button and connect the clicked signal
	var button = widgets.NewQPushButton2("Click me!", nil)
	button.ConnectClicked(func(flag bool) {
		widgets.QMessageBox_Information(nil, "OK", "You clicked me!", widgets.QMessageBox__Ok, widgets.QMessageBox__Ok)
	})

	//create a layout and add the button
	var layout = widgets.NewQVBoxLayout()
	layout.AddWidget(button, 0, core.Qt__AlignCenter)

	//create a window, add the layout and show the window
	var window = widgets.NewQMainWindow(nil, 0)
	window.SetWindowTitle("Hello World Example")
	window.SetMinimumSize2(200, 200)
	window.Layout().DestroyQObject()
	window.SetLayout(layout)
	window.Show()

	widgets.QApplication_Exec()
}
