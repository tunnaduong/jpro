
from .models import Profile
from .serializers import MyTokenObtainPairSerializer, ProfileSerializer, ProfileUpdateSerializer
from rest_framework.permissions import AllowAny
from rest_framework_simplejwt.views import TokenObtainPairView
from blog.permisssions import IsOwnerOrReadOnly
from rest_framework.permissions import IsAuthenticated

class MyObtainTokenPairView(TokenObtainPairView):
    permission_classes = (AllowAny,)
    serializer_class = MyTokenObtainPairSerializer


from django.contrib.auth.models import User
from .serializers import RegisterSerializer
from rest_framework import generics


class RegisterView(generics.CreateAPIView):
    queryset = User.objects.all()
    permission_classes = (IsAuthenticated,)
    serializer_class = RegisterSerializer


class ProfileDetailView(generics.RetrieveAPIView):
    queryset = Profile.objects.all()
    permission_classes = [IsAuthenticated]
    serializer_class = ProfileSerializer

class ProfileUpdateView(generics.UpdateAPIView):
    queryset = Profile.objects.all()
    permission_classes = [IsOwnerOrReadOnly,IsAuthenticated]
    serializer_class = ProfileUpdateSerializer  