using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class HudController : MonoBehaviour {

	public int life;
	public Text txtScore;
	public Text txtLife;
	Button buttonPause;
	int score;
	void Start () {
		score = 0;
		txtScore.text = "Score: " + score;
		txtLife.text = "Life: " + life;
		buttonPause = GameObject.Find ("pauseButton").
			GetComponent<Button> ();
		buttonPause.onClick.AddListener (() => controlPause());
	}

	void controlPause(){
		if (Time.timeScale == 1) {
			Time.timeScale = 0;
		} else if (Time.timeScale == 0) {
			Time.timeScale = 1;
		}
	}

	public void updateScore(){
//		score += 1;
		score++;
//		score = score + 1;
		txtScore.text = "Score: "+score;
	}

	public void updateLife(){
		life++;
		txtLife.text = "Life: " + life;
	}

	public void reduceLife(){
		life--;
		txtLife.text = "Life: " + life;
		if (life == 0) {
			PlayerPrefs.SetInt ("score", score);
			SceneManager.LoadScene ("GameOver");
		}
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
