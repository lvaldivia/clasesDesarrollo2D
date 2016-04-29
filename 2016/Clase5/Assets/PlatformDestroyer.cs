using UnityEngine;
using System.Collections;

public class PlatformDestroyer : MonoBehaviour {

	// Use this for initialization
	private GameObject platformDestroyer;
	void Start () {
		platformDestroyer = GameObject.Find ("platformCollector");
	}
	
	// Update is called once per frame
	void Update () {
		if (transform.position.x < platformDestroyer.transform.position.x) {
			Destroy (gameObject);
		}
	}
}
