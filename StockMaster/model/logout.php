<?php
include "connect.php";

session_start();
session_destroy();
header('Location: ../view/pages_login.php');
