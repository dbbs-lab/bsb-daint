from neuro3d import set_backend
from neuro3d.render import render
from mpi4py.MPI import COMM_WORLD
import sys

if not COMM_WORLD.Get_rank():
  print("Rendering blend file", sys.argv[1], "on", COMM_WORLD.Get_size(), "workers", flush=True)
set_backend("blender")
render(sys.argv[1], None, comm=COMM_WORLD)
