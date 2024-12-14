package cloudevents

import (
	"context"
	"fmt"
	"log"
	"net/http"

	cloudevents "github.com/cloudevents/sdk-go/v2"
)

func main() {
	c, err := cloudevents.NewClientHTTP()
	if err != nil {
		log.Fatalf("failed to create client, %v", err)
	}

	// Create an Event.
	event := cloudevents.NewEvent()
	event.SetSource("example/uri")
	event.SetType("example.type")
	event.SetData(cloudevents.ApplicationJSON, map[string]string{"hello": "world"})

	// Set a target.
	ctx := cloudevents.ContextWithTarget(context.Background(), "http://localhost:8080/")

	// Send that Event.
	if result := c.Send(ctx, event); cloudevents.IsUndelivered(result) {
		log.Fatalf("failed to send, %v", result)
	} else {
		log.Printf("sent: %v", event)
		log.Printf("result: %v", result)
	}
	// The default client is HTTP.
	c, err = cloudevents.NewClientHTTP()
	if err != nil {
		log.Fatalf("failed to create client, %v", err)
	}
	if err = c.StartReceiver(context.Background(), receive); err != nil {
		log.Fatalf("failed to start receiver: %v", err)
	}
}

func receive(event cloudevents.Event) {
	// do something with event.
	fmt.Printf("%s", event)
}

func handler(w http.ResponseWriter, r *http.Request) {
	event, err := cloudevents.NewEventFromHTTPRequest(r)
	if err != nil {
		log.Printf("failed to parse CloudEvent from request: %v", err)
		http.Error(w, http.StatusText(http.StatusBadRequest), http.StatusBadRequest)
	}
	w.Write([]byte(event.String()))
	log.Println(event.String())
}
