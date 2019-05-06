import React from 'react';
import './App.css';
import { init } from 'react-crx';

const { Put, Ctx } = init({foo: 1});

function App() {
  return (
    <div className="App">
      <Ctx>{s => <div>{s.foo}</div>}</Ctx>
      <button onClick={() => Put(s => (s.foo = s.foo + 1))}>add</button>
    </div>
  );
}

export default App;

