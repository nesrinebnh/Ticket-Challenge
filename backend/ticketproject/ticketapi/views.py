from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import TicketSerializer
from .models import Ticket

@api_view(['GET'])
def getTickets(request):
    print('getTickets')
    tickets = Ticket.objects.all()
    serializer = TicketSerializer(tickets, many=True)
    return Response(serializer.data)

@api_view(['POST'])
def createTicket(request):
    data = request.data 
    ticket = Ticket.objects.create(
        title = data['title'],
        description = data['description'],
        status = data['status']
    )
    serializer = TicketSerializer(ticket, many=False)
    return Response(serializer.data)


@api_view(['PUT'])
def updateTicket(request, pk):
    ticket = Ticket.objects.get(id=pk)
    serializer = TicketSerializer(ticket, data=request.data)
    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)



