"""
The define source lists definitions set by an external entity. This
includes application specific constants which are too volatile to
incorporate in the constant source but not flexible enough for
environment setting. The define source *should* be constructed
externally before the application is loaded.
"""

from enum import Enum

class Define(Enum):
	APP_NAME = 'Testapp'
	APP_URL = 'https://172.16.0.24'
	APP_THEME = ''

