from django.contrib import admin

# Register your models here.
from recommend.models import Question, Choice


admin.site.register(Question)
admin.site.register(Choice)
