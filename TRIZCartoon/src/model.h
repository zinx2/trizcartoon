#pragma once
#include <QObject>
#include <QList>
#include <QDebug>

using namespace std;

class Concept : public QObject {
	Q_OBJECT
		Q_PROPERTY(int id READ id WRITE setId NOTIFY idChanged)
		Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
        Q_PROPERTY(QString src READ src WRITE setSrc NOTIFY srcChanged)
    Q_PROPERTY(bool visibled READ visibled WRITE setVisibled NOTIFY visibledChanged)

public:
	Concept(QObject* parent = 0) : QObject(parent) { }
    Concept(int id, QString name, QString src) : m_id(id), m_name(name), m_src(src) { }

	Q_INVOKABLE int id() const { return m_id; }    
	Q_INVOKABLE QString name() const { return m_name; }
    Q_INVOKABLE QString src() const { return m_src; }
    Q_INVOKABLE bool visibled() const { return m_visibled; }

	public slots:
	void setId(const int id) { m_id = id; }    
	void setName(const QString &m) { m_name = m; emit nameChanged(); }
    void setSrc(const QString &m) { m_src = m; emit srcChanged(); }
    void setVisibled(const bool &m) { m_visibled = m; emit visibledChanged(); }

signals:
	void idChanged();
	void nameChanged();
    void srcChanged();
    void visibledChanged();

private:
	int m_id = -1;
	QString m_name;
    QString m_src;
    bool m_visibled = true;

};
//Q_DECLARE_METATYPE(Concept*)



class Model : public QObject
{
	Q_OBJECT
        Q_PROPERTY(int currentIndex READ currentIndex WRITE setCurrentIndex NOTIFY currentIndexChanged)
        Q_PROPERTY(QList<QObject*> list READ list NOTIFY listChanged)

public:
	Model()
	{	
        m_list.append(new Concept(0, "분리(Segmentation)", "principe_1"));
        m_list.append(new Concept(1, "추출(Extracting)", "principe_2"));
        m_list.append(new Concept(2, "국소적 성질(Local Quality)", "principe_3"));
        m_list.append(new Concept(3, "비대칭(Asymmetry)", "principe_4"));
        m_list.append(new Concept(4, "결합 / 통합(Combining / Consolidation)", "principe_5"));
        m_list.append(new Concept(5, "범용성 / 다용도(Universality)", "principe_6"));
        m_list.append(new Concept(6, "포개기(Nesting)", "principe_7"));
        m_list.append(new Concept(7, "평형추 / 공중부양(Counterweight / Levitation)", "principe_8"));
        m_list.append(new Concept(8, "사전 반대조치(Prior Counteraction)", "principe_9"));
        m_list.append(new Concept(9, "사전 조치(Prior Action)", "principe_10"));
        m_list.append(new Concept(10, "사전 예방 / 보정(Cushion in Advance / Compensation)", "principe_11"));
        m_list.append(new Concept(11, "높이 맞추기 / 긴장완화(Equipotentiality / Remove tension)", "principe_12"));
        m_list.append(new Concept(12, "반대로 하기(Do it in Reverse)", "principe_13"));
        m_list.append(new Concept(13, "곡선화 / 구형화(Curve / Spheroidality)", "principe_14"));
        m_list.append(new Concept(14, "역동성(Dynamicity)", "principe_15"));
        m_list.append(new Concept(15, "과부족 조치(Partial or Excessive Action)", "principe_16"));
        m_list.append(new Concept(16, "차원 바꾸기(Transition into a New Dimension)", "principe_17"));
        m_list.append(new Concept(17, "기계적 진동(Mechanical Vibration)", "principe_18"));
        m_list.append(new Concept(18, "주기적 작동(Periodic Action)", "principe_19"));
        m_list.append(new Concept(19, "유용한 작용의 지속(Continuity of a Useful Action)", "principe_20"));
        m_list.append(new Concept(20, "고속처리 / 뛰어넘기(Rushing Through / Skipping)", "principe_21"));
        m_list.append(new Concept(21, "전화위복(Convert Harm into Benefit)", "principe_22"));
        m_list.append(new Concept(22, "피드백(Feedback)", "principe_23"));
        m_list.append(new Concept(23, "매개체(Mediator)", "principe_24"));
        m_list.append(new Concept(24, "셀프서비스(Self Service)", "principe_25"));
        m_list.append(new Concept(25, "복제(Copying)", "principe_26"));
        m_list.append(new Concept(26, "일회용품(Dispose)", "principe_27"));
        m_list.append(new Concept(27, "기계 시스템의 대체(Replacement of Mechanical System)", "principe_28"));
        m_list.append(new Concept(28, "공기, 유압 활용(Pneumatics and Hydraulics)", "principe_29"));
        m_list.append(new Concept(29, "유연한 막 또는 얇은 필름(Flexible or Thin Films)", "principe_30"));
        m_list.append(new Concept(30, "구멍 / 다공성 물질(Hole / Porous material)", "principe_31"));
        m_list.append(new Concept(31, "색 변경(Changing the Color)", "principe_32"));
        m_list.append(new Concept(32, "동질성(Homogeneity)", "principe_33"));
        m_list.append(new Concept(33, "폐기 및 재생(Rejecting and Regenerating Parts)", "principe_34"));
        m_list.append(new Concept(34, "속성 변환(Transformation of Property)", "principe_35"));
        m_list.append(new Concept(35, "상전이(Phase Transition)", "principe_36"));
        m_list.append(new Concept(36, "열팽창(Thermal Expansion)", "principe_37"));
        m_list.append(new Concept(37, "활성화 / 산화 가속(Enrich / Accelerated Oxidation)", "principe_38"));
        m_list.append(new Concept(38, "비활성화 / 불활성 환경(Calm / Inert Environment)", "principe_39"));
        m_list.append(new Concept(39, "복합 재료(Composite Materials)", "principe_40"));
	}

    Q_INVOKABLE int currentIndex() const { return m_currentIndex; }
    Q_INVOKABLE int size() const { return m_list.length(); }
    Q_INVOKABLE QString getName(int index) { return qobject_cast<Concept*>(m_list[index])->name(); }
    Q_INVOKABLE QString getSrc(int index) { return qobject_cast<Concept*>(m_list[index])->src(); }
    Q_INVOKABLE QList<QObject*> list() const { return m_list; }
    Q_INVOKABLE QObject* getCurrentConcept() { return m_list[m_currentIndex]; }

public slots:
    void setCurrentIndex(const int id) { m_currentIndex = id; emit currentIndexChanged(); }
    void initializeIndex() { m_currentIndex = -1; }
    void initialize()
    {
        for(QObject* obj : m_list)
        {
            Concept* cb = qobject_cast<Concept*>(obj);
            cb->setVisibled(true);
        }

        emit listChanged();
    }
    void search(QString str)
    {

        for(QObject* obj : m_list)
        {
            Concept* cb = qobject_cast<Concept*>(obj);
            cb->setVisibled(cb->name().contains(str));
            qDebug() << cb->name();
            qDebug() << str;
            qDebug() << cb->name().contains(str);
        }
        emit listChanged();
    }

signals:
    void listChanged();
    void currentIndexChanged();

private:
    QList<QObject*> m_list;
    int m_currentIndex = 0;

};
