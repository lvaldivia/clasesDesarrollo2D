using UnityEngine;
using System.Collections;

public class SceneFader : MonoBehaviour {

	public static SceneFader instance;

	void Awake(){
		if (instance != null) {
			Destroy (gameObject);
		} else {
			instance = this;
			DontDestroyOnLoad (gameObject);
		}

	}


}
