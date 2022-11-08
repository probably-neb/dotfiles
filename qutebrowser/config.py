# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

config.load_autoconfig()

config.source("base16.py")

c.tabs.position = 'bottom'
# c.zoom.default = 200
c.qt.highdpi = True
