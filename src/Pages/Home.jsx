import React from "react";
import "./Home.css";
import { faBook, faGraduationCap } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

function Home() {
  return (
    <div className="homecon">
      <div className="home">
        <div className="hometext">
          <h2>
            Empowering Future Health Innovators For <em> Sustainer</em> Public
            Health Care
          </h2>
          <button>Check Out Our Library</button>
        </div>
      </div>

      <main>
        <div className="sub-main">
          <section class="posts">
            <article>
              <div class="pic">
                <div className="icon-container">
                  <FontAwesomeIcon icon={faGraduationCap} />
                </div>
              </div>
              <div class="info">
                <h3>The best learning methods</h3>
                <p>
                  Sed ut perspiciatis unde omnis iste natus error sit voluptatem
                  accusantium doloremque laudantium, totam rem aperiam, eaque
                  ipsa quae ab illo inventore veritatis quasi architecto beatae
                  vitae dicta sunt explicabo.{" "}
                </p>
              </div>
            </article>

            <article>
              <div class="pic">
                <div className="icon-container">
                  <FontAwesomeIcon icon={faBook} />
                </div>
              </div>
              <div class="info">
                <h3>Awesome results of our students</h3>
                <p>
                  Vero eos et accusamus et iusto odio dignissimos ducimus
                  blanditiis praesentium voluptatum deleniti atque corrupti quos
                  dolores et quas molestias excepturi sint occaecati cupiditate
                  non provident, similique sunt in culpa.
                </p>
              </div>
            </article>
          </section>
        </div>
      </main>
    </div>
  );
}

export default Home;








  