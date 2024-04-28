import { createBrowserRouter } from "react-router-dom";
import ErrorPage from "../src/views/errorPage.tsx";
import Home from '../src/views/Home.tsx';
import Other from '../src/views/Other.tsx';

const router = createBrowserRouter([
    {
      path: "/",
      element: <Home />,
      errorElement: <ErrorPage />,
    },
    {
      path: "/other",
      element: <Other />,
      errorElement: <ErrorPage />,
    }
  ]);

export default router