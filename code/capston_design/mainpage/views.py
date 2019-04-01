from django.http import HttpResponse
from django.shortcuts import render

def index(request):
    return HttpResponse("20대 남녀 코디 추천 웹사이트 ")
