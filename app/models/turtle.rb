# interface to communicate with the javascript turtle object
class TurtleInterface < Qt::Object
  q_classinfo("D-Bus Interface", "com.kidsruby.Turtle")
  
  slots 'background(const QString&)', 'pensize(int)', 'pencolor(const QString&)', 'goto(int, int)', 'setheading()', 'forward(int)', 'turnleft(int)', 'turnright(int)', 'draw()'
  
  def initialize(main)
    super
    
    @main_widget = main
    @main_frame = @main_widget.page.mainFrame
    Qt::DBusConnection.sessionBus.registerObject("/Turtle", self, Qt::DBusConnection::ExportAllSlots)
  end

  # ex: blue
  def background(color)
  end

  # ex: 2
  def pensize(size)
    code = "callTurtle('pensize', #{size});"
    @main_frame.evaluateJavaScript(code)
  end

  # ex: yellow
  def pencolor(color)
    code = "callTurtle('penstyle', #{color});"
    @main_frame.evaluateJavaScript(code)
  end

  def goto(x, y)
  end

  def setheading(heading)
  end

  def forward(distance)
    code = "callTurtle(['go', #{distance}]);"
    @main_frame.evaluateJavaScript(code)
  end

  def turnleft(degrees)
  end

  def turnright(degrees)
  end
  
  def draw
    code = "callTurtle(['draw']);"
    @main_frame.evaluateJavaScript(code)
  end
end