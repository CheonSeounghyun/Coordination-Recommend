from django.http import HttpResponse
from django.shortcuts import render

def index(request):
    return HttpResponse("와! 첫페이지!!!")
