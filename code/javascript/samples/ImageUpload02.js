/***
 * Excerpted from "Programming Elm",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material,
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose.
 * Visit http://www.pragmaticprogrammer.com/titles/jfelm for more book information.
***/
import React, { Component } from 'react';
import { Elm } from './ImageUpload.elm';
import './ImageUpload.css';

class ImageUpload extends Component {
  constructor(props) {
    super(props);
    this.elmRef = React.createRef();
    this.readImages = this.readImages.bind(this);
  }

  componentDidMount() {
    this.elm = Elm.ImageUpload.init({
      node: this.elmRef.current,
    });

    this.elm.ports.uploadImages.subscribe(this.readImages);
  }

  componentWillUnmount() {
    this.elm.ports.uploadImages.unsubscribe(this.readImages);
  }

  readImage(file) {
    const reader = new FileReader();
    const promise = new Promise((resolve) => {
      reader.onload = (e) => {
        resolve({
          url: e.target.result,
        });
      };
    });
    reader.readAsDataURL(file);
    return promise;
  }

  readImages() {
    const element = document.getElementById('file-upload');
    const files = Array.from(element.files);

    Promise.all(files.map(this.readImage))
      .then(this.props.onUpload);
  }

  render() {
    return <div ref={this.elmRef} />;
  }
}

export default ImageUpload;
