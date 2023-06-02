from .base import *

print("production settings")

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.sqlite3",
        "NAME": BASE_DIR / "pd.sqlite3",
    }
}
