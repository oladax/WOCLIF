import React, { useState } from "react";
import Biology from "../category/Biology"; // Importing the Biology component
import Physics from "../category/Physics"; // Importing the Physics component
import Physiology from "../category/Physiology"; // Importing the Physiology component
import Chemistry from "../category/Chemistry"; // Importing the Chemistry component
import BookSearch from "../category/BookSearch"; // Importing the BookSearch component
import "../App.css"; // Corrected import path for App.css

function Bookpage() {
  const [selectedCategory, setSelectedCategory] = useState("biology"); // Set default to "biology"

  // Function to handle changes in the dropdown menu
  const handleCategoryChange = (event) => {
    setSelectedCategory(event.target.value); // Updating the selected category state based on the user's choice
  };

  return (
    <div className="app">
      <div>
        <h1>Welcome to our book website</h1>
        <div className="book">
          <BookSearch />
        </div>
        {/* Dropdown menu for selecting a category */}
        <select
          name="category"
          id="category-select"
          onChange={handleCategoryChange} // Event handler for change event
          value={selectedCategory} // Set the selected value to the state value
        >
          <option value="">Select a category</option> {/* Default option */}
          <option value="biology">Biology</option> {/* Option for Biology */}
          <option value="physics">Physics</option> {/* Option for Physics */}
          <option value="physiology">Physiology</option>{" "}
          {/* Option for Physiology */}
          <option value="chemistry">Chemistry</option>{" "}
          {/* Option for Chemistry */}
        </select>
      </div>

      <div>
        {/* Conditionally rendering the selected category component */}
        {selectedCategory === "biology" && <Biology />}{" "}
        {/* Display Biology component if biology is selected */}
        {selectedCategory === "physics" && <Physics />}{" "}
        {/* Display Physics component if physics is selected */}
        {selectedCategory === "physiology" && <Physiology />}{" "}
        {/* Display Physiology component if physiology is selected */}
        {selectedCategory === "chemistry" && <Chemistry />}{" "}
        {/* Display Chemistry component if chemistry is selected */}
      </div>
    </div>
  );
}

export default Bookpage; // Exporting the Bookpage component as the default export
