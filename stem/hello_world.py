

# https://stem.torproject.org/faq.html#how-do-i-connect-to-tor
# https://stem.torproject.org/tutorials/the_little_relay_that_could.html

# >cat /etc/tor/torrc
# ...
# >tor --hash-password test
#   16:EA3C47E90717383960CB5A288CE394714B44C49A3C01F1C02BC3D6894D
#
# HashedControlPassword 16:EA3C47E90717383960CB5A288CE394714B44C49A3C01F1C02BC3D6894D
# ControlPort 9051

from stem.control import Controller

with Controller.from_port(port = 9051) as controller:
  controller.authenticate("test")  # See top

  bytes_read = controller.get_info("traffic/read")
  bytes_written = controller.get_info("traffic/written")

  print("My Tor relay has read %s bytes and written %s." % (bytes_read, bytes_written))

