using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class ButtonStart : MonoBehaviour
{

	// Use this for initialization
	void Start ()
	{
		
		Button button = GetComponent<Button> ();
		button.onClick.AddListener (() => goGame ());
		print (button);

	}

	void goGame ()
	{
		SceneManager.LoadScene ("Game");
	}
	// Update is called once per frame
	void Update ()
	{
		
	

	}
}
