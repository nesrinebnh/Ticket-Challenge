from django.urls import path
from . import views

urlpatterns = [
    path('tickets/', views.getTickets),
    path('tickets/create/', views.createTicket),
    path('tickets/<str:pk>/update/', views.updateTicket)
]

