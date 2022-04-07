package main

import(
	"github.com/labstack/echo/v4"
	"net/http"
	"proxy/Services"
)

func main() {
	e := echo.New()

	e.GET("/", func(c echo.Context) error {
		return c.JSON(http.StatusOK, proxy.GetFromApi())
	})

	e.Start(":8080")
}
