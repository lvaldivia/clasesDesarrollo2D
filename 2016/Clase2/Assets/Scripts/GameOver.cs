﻿using UnityEngine;
using System.Collections;

public class GameOver : MonoBehaviour {

	// Use this for initialization
	void Start () {
		print (PlayerPrefs.GetInt ("score"));
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
