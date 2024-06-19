import React from 'react'
import schlogo from '../Images/Schlogo.png'
import { Link, Outlet } from 'react-router-dom'

function Header() {
  return (
    <div className="Header-container">
      <header>
        <div>
          <nav>
            <ul>
              <li>
                <Link to="/">Home</Link>
              </li>
              <li>
                <Link to="/gallery">Gallery</Link>
              </li>
              <li>
                <Link to="/">Library</Link>
              </li>
            </ul>
          </nav>

          <div className="schlogo">
            <a href="/">
              <img src={schlogo} alt="School logo" />
            </a>
          </div>

          <nav>
            <ul>
              <li>
                <Link to="about">About</Link>
              </li>
              <li>
                <Link to="/gallery">Contact</Link>
              </li>
              <li>
                <Link to="/">Account</Link>
              </li>
            </ul>
          </nav>
        </div>
      </header>
      <div>
        <Outlet/>
      </div>
    </div>
  );
}

export default Header
