from django.shortcuts import render
from screen.models import Screen

def movie(request):
    qs = Screen.objects.all()
    context
    return render(request,'movie.html')