/***
 * Excerpted from "Programming Elm",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material,
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose.
 * Visit http://www.pragmaticprogrammer.com/titles/jfelm for more book information.
***/
import './main.css';
import { Elm } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';

var app = Elm.Main.init({
  node: document.getElementById('root')
});

var socket = null;

app.ports.listen.subscribe(listen);

function listen(url) {
  if (!socket) {
    socket = new WebSocket(url);

    socket.onmessage = function(event) {
      app.ports.receive.send(event.data);
    };
  }
}

app.ports.close.subscribe(close);

function close() {
  if (socket) {
    socket.close();
    socket = null;
  }
}

registerServiceWorker();
