from .views import MyObtainTokenPairView,RegisterView,ProfileDetailView,ProfileUpdateView
from rest_framework_simplejwt.views import TokenRefreshView
from django.urls import path

urlpatterns = [
    path('login/', MyObtainTokenPairView.as_view(), name='token_obtain_pair'),
    path('login/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('register/',RegisterView.as_view(), name = 'register'),  
    path('<int:pk>/profile', ProfileDetailView.as_view(), name = 'user-profile'),
    path('<int:pk>/profile/update', ProfileUpdateView.as_view(), name = 'profile-update'),
]