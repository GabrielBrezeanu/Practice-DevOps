from django.urls import path
from django.http import HttpResponse
from . import views
import django_entrypoint

#URLConf
urlpatterns = [
    path('hello/', views.say_hello)
]