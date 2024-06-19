// App.js

import React from "react";
import Home from "./Pages/Home";
import Header from  './Pages/Header'
import About from "./Pages/About";
import Contact from "./Pages/Contact";
import Gallery from "./Pages/Gallery";
import Nopage from "./Pages/Nopage";
import Account from "./Account/Account";
import Bookpage from "./Pages/Bookpage";
import { Route, Routes} from "react-router";
import { BrowserRouter } from "react-router-dom";

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Header />}>
          <Route index element={<Home />} />
          <Route path="bookpage" element={<Bookpage/>} />
          <Route path="about" element={<About />} />
          <Route path="contact" element={<Contact />} />
          <Route path="gallery" element={<Gallery />} />
          <Route path="account" element={<Account/>} />
          <Route path="*" element={<Nopage />} />
        </Route>
      </Routes>
    </BrowserRouter>
  );
}

export default App;
