
from django.urls import path,include
from . import views

app_name = 'screen'

urlpatterns = [
    path('movie/', views.movie,name='movie'),
]


