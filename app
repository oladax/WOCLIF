import React, { useState } from 'react';
import schlogo from '../Images/Schlogo.png';
import { Link, Outlet } from 'react-router-dom';
import { faBars, faTimes } from '@fortawesome/free-solid-svg-icons'; // Import faTimes for close icon
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

function Header() {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  const toggleMenu = () => {
    setIsMenuOpen(!isMenuOpen);
  };

  return (
    <div className="Header-container">
      <header>
        <div>
          <div className="schlogo">
            <a href="/">
              <img src={schlogo} alt="School logo" />
            </a>
          </div>

          <nav>
            <ul>
              <li>
                <Link to="/">Home</Link>
              </li>
              <li>
                <Link to="/">Library</Link>
              </li>
              <li>
                <Link to="about">About</Link>
              </li>
              <li>
                <Link to="/contact">Contact</Link>
              </li>
              <li>
                <Link to="/">Account</Link>
              </li>
            </ul>
          </nav>

        
          <div className="dropicon" onClick={toggleMenu}>
            <span> <FontAwesomeIcon icon={isMenuOpen ? faTimes : faBars} />
            </span>
          </div>
        </div>
      </header>
      <div>
        <Outlet />
      </div>
    </div>
  );
}

export default Header;


* {
margin: 0;
padding: 0;
box-sizing: border-box;
}

body{

}
.Header-container {
width: 100%;
}

.Header-container header {
margin: auto;
max-width: 85rem;

}


.Header-container header div {
display: flex;
justify-content: space-between;
align-items: center;
padding-left: 1.5rem;
padding-right: 1.5rem;
}

header div nav {
display: inline-block;
}

header div nav ul {
display: inline-block;
}

header div nav ul li {
list-style: none;
display: inline-block;
vertical-align: baseline;
}

header div nav ul li a {
font-size: 19px;
color: #8c929c;
display: block;
margin-left: 20px;
margin-right: 20px;
text-decoration: none;
font-style: normal;
letter-spacing: 1px;
font-weight: 300;
font-family: 'BebasNeue', sans-serif;
}


header div nav ul li a:hover {
text-decoration: underline;
text-underline-offset: 15px; /* Adjust this value to set the desired gap */
color: navy;
}


.schlogo img {
width: 90px;
height: 90px;
object-fit: cover;
vertical-align: baseline;
margin-left: -10px;
}


.Header-container header div .dropicon{
display: none;
}

.Header-container header div .dropicon span{
color: #333;
cursor: pointer;
}


@media (max-width: 900px) {

header div nav {
  display: none;
}

.Header-container header div .dropicon{
  display: block;
}


.Header-container header div {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-left: 1rem;
  padding-right: 1rem;
}
}