from django.forms.models import inlineformset_factory

from .models import Album, Photo



PhotoInlineFormSet = inlineformset_factory(Album, Photo,
    fields = ['image', 'title', 'description'],
    extra = 2)
