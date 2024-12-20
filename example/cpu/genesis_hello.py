"""
Copy of a sample script from the genesis official documentation:
https://genesis-world.readthedocs.io/en/latest/user_guide/getting_started/hello_genesis.html
"""
import genesis as gs
gs.init(backend=gs.cpu)

scene = gs.Scene(show_viewer=True)
plane = scene.add_entity(gs.morphs.Plane())
franka = scene.add_entity(
    gs.morphs.MJCF(file='xml/franka_emika_panda/panda.xml'),
)

scene.build()

for i in range(1000):
    scene.step()
