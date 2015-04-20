import {Socket} from "phoenix"

let socket = new Socket("/ws")
socket.connect()
socket.join("tables:lobby", {}).receive("ok", chan => {
  console.log("Welcome to Plixir!")

  chan.on("table_created", payload => {
    $("#tables").find('tbody')
      .append($('<tr>')
        .append($('<td>').append(payload.name))
        .append($('<td>').append(payload.type))
        .append($('<td>').append(payload.max_players))
        .append($('<td>').append(payload.current_players))
      )
  })
})