#!/usr/bin/python3
from models.engine import file_storage
from models.base_model import BaseModel
from models.city import City
from models.review import Review
from models.state import State
from models.user import User
from models.place import Place

dummy_classes = {"BaseModel": BaseModel, "User": User,
                 "Review": Review, "City": City, "State": State, "Place": Place}

storage = file_storage.FileStorage()
storage.reload()
