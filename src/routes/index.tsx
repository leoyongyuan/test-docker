import { createBrowserRouter } from "react-router-dom";
import ErrorPage from "../views/errorPage.tsx";
import Home from "../views/Home.tsx";
import Other from "../views/Other.tsx";

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
	},
]);

export default router;
