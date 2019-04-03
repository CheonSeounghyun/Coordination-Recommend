from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.

def title(request):
    return render(request, 'recommend/index.html')
