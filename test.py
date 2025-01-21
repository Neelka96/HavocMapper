from bokeh.io.export import export_png
from bokeh.plotting import figure
import os

# Set TMPDIR explicitly
os.environ['TMPDIR'] = '/tmp'

# Create a Bokeh figure
p = figure(width=800, height=600)
p.line([1, 2, 3], [4, 5, 6])

# Export as PNG using canvas
p.output_backend = 'canvas'
try:
    export_png(p, filename="test_canvas_plot.png")
    print("PNG export successful!")
except Exception as e:
    print(f"PNG export failed: {e}")
