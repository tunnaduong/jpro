from unicodedata import name
from django import views
from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.home_views, name='home'),
    path('about/', views.about, name='about'),
    path('discussion/', views.discussion, name='discussion'),
    path('learn/', views.learn, name='learn'),
    path('techtalk/', views.techtalk, name='techtalk'),
    path('', include('users.urls')),
]