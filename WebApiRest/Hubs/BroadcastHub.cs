using Microsoft.AspNetCore.SignalR;

namespace WebApiRest.Hubs
{
    public class BroadcastHub: Hub
    {
        //public override async Task OnConnectedAsync()
        //{
        //    await Clients.All.SendAsync("ReceiveMessage", $"{Context.ConnectionId} connected.");
        //}

        public async Task EnviarMensaje(string message)
        {            
            await Clients.All.SendAsync("Respuesta del SignalR: ", message);
        }

        //public override async Task OnDisconnectedAsync(Exception exception)
        //{
        //    await Clients.All.SendAsync("ReceiveMessage", $"{Context.ConnectionId} disconnected.");
        //}

    }
}
