import speech_recognition as sr
import pyttsx3

rec = sr.Recognizer()

try:
    with sr.Microphone() as mic:
        rec.adjust_for_ambient_noise(mic, duration=0.2)
        audio = rec.listen(mic)
        text = rec.recognize_google(audio, language='en-IN', show_all=True)
        print(text["alternative"][0]['transcript'])
except Exception as e:
    print(e)
