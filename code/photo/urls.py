from django.urls import path

from .views import *



app_name = 'photo'
urlpatterns = [

    # Example: /
    path('', AlbumLV.as_view(), name='index'),

    # Example: /album/, same as /
    path('album/', AlbumLV.as_view(), name='album_list'),

    # Example: /album/99/
    path('album/<int:pk>/', AlbumDV.as_view(), name='album_detail'),

    # Example: /photo/99/
    path('photo/<int:pk>/', PhotoDV.as_view(), name='photo_detail'),
]

