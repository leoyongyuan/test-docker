import { Link } from "react-router-dom";

function App() {
  return (
    <>
      <h1>Other</h1>
      <Link className="nav-link" to="/">Home</Link>
      <hr></hr>
      <Link className="nav-link" to="/Other">Other</Link>
    </>
  )
}
export default App