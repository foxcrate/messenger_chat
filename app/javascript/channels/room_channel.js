import consumer from "channels/consumer";

// document.addEventListener("DOMContentLoaded", ()=> {   //same as: $(function() {

    console.log("page reloaded");

    const user_id = Number(document.getElementById("user_id").textContent);
    // console.log("user_id: ", user_id);
    const room_id = Number(document.getElementById("room_id").textContent);
    console.log("room_id: ", room_id);

    consumer.subscriptions.create(
        { channel: "RoomChannel", room_id: room_id },
        {
            connected() {
                // Called when the subscription is ready for use on the server
                console.log("connected to room:", room_id);
            },

            disconnected() {
                // Called when the subscription has been terminated by the server
                console.log("disconnected from room:", 1);
            },

            received(data) {
                // Called when there's incoming data on the websocket for this channel
                // console.log(data);

                // const user_id = Number(document.getElementById("user_id").textContent);

                console.log("data: ", data);

                // const messageContainer = document.getElementById("messages");
                //
                // let html;
                // if (user_id === data.message.user_id) {
                //     html = data.mine;
                // } else {
                //     html = data.theirs;
                // }
                //
                // messageContainer.innerHTML = messageContainer.innerHTML + html;
            },
        }
    );

// })