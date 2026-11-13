from django.shortcuts import render
from board.models import Board

def blist(request):
    qs = Board.objects.all()
    context = {'list':qs}
    return render(request,'blist.html',context)