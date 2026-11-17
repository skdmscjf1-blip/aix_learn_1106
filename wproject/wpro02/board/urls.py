
from django.urls import path,include
from . import views

app_name='board'

urlpatterns = [
    path('ajax_data/', views.ajax_data,name='ajax_data'),
]
