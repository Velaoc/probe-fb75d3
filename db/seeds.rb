# Optional demo data: a few guestbook entries so the wall has life in a
# preview. Production runs with an empty database and is fully functional.
Message.create!([
  { name: "Vela",   body: "First to sign. Small board, big wall." },
  { name: "Nova",   body: "Nice place you've got here, little sister." },
  { name: "Aregus", body: "Ship it." }
])
