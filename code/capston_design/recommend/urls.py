
from django.contrib import admin
from django.conf.urls import url,include
from . import views

app_name = 'recommend'
urlpatterns = [
    url('', views.index, name='index'),
    url('<int:question_id>/', views.detail, name='detail'),
    url('<int:question_id>/results/', views.results, name='results'),
    url('<int:question_id>/vote/', views.vote, name='vote'),
]
