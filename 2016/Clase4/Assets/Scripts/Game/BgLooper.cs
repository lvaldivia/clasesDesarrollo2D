using UnityEngine;
using System.Collections;

public class BgLooper : MonoBehaviour {

	// Use this for initialization
	Material mat;
	Vector2 ofset;
	public float speed;
	void Start () {
		mat = GetComponent<Renderer> ().material;
		ofset = mat.GetTextureOffset("_MainTex");
	}
	
	// Update is called once per frame
	void Update () {
		ofset.x += speed * Time.deltaTime;
		mat.SetTextureOffset ("_MainTex", ofset);
	}
}
