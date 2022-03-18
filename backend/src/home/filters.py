import django_filters
from blog import models

class BlogFilter(django_filters.FilterSet):

    CHOICES = (
        ('ascending', 'Ascending'),
        ('descending', 'Descending')
    )
    
    ordering = django_filters.ChoiceFilter(label='Ordering', choices=CHOICES, method='filter_by_order')

    class Metta:
        model = models.Post
        fields = {
            'title': ['icontains'],
            'author': ['icontains'],
            'status': ['icontains'],
        }
    
    def filter_by_order(self, queryset, name, value):
        expression = 'blog_views' if value == 'ascending' else '-blog_views'
        return queryset.order_by(expression)